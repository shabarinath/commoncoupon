var wallet_amount = $('#wallet_amount').val();
var vouchermap = new Object();

function flip(cardName){
	var selectBoxValue = $('#select_' + cardName).val();
	if(selectBoxValue == '' || selectBoxValue <= 0){
		alert('Please select amount');
	}
	$('#pick_' + cardName).hide();
	$('#picked_' + cardName).show();
	$('#selectedamount_' + cardName).html(selectBoxValue);
	$('#overlay_' + cardName).attr('style','opacity:1');
	vouchermap[cardName] = selectBoxValue;
	displayCumulativeAmount();
}

function displayCumulativeAmount() {
	var vouchers_cummulative_amount = 0;
	$.map( vouchermap, function( value, index ) {
		vouchers_cummulative_amount = (parseFloat(vouchers_cummulative_amount) + parseFloat(value));
	});
	$('#vouchers_amount_display').html(vouchers_cummulative_amount);
}

function unFlip(cardName){
		$('#picked_' + cardName).hide();
		$('#pick_' + cardName).show();
		$('#selectedamount_' + cardName).html('');
		$('#overlay_' + cardName).removeAttr('style');
		delete vouchermap[cardName];
		displayCumulativeAmount();
}

function expandRedeemForm(){
	$('#redeemForm').show();
}

function closeRedeemForm(){
	$('#redeemForm').hide();
}
