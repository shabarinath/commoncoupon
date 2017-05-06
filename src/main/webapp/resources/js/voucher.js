var wallet_amount = $('#wallet_amount').val();
var isCouponRedeemptionChargesEnabled = $('#isCouponRedeemptionChargesEnabled').val();	
var totalAmountIncludingCharges="";
var vouchermap = new Object();

function flip(cardName){
	var selectBoxValue = $('#select_' + cardName).val();
	if(selectBoxValue == '' || selectBoxValue <= 0){
		alert('Please select amount');
		return false;
	}
	$('#pick_' + cardName).hide();
	$('#picked_' + cardName).show();
	$('#selectedamount_' + cardName).html(selectBoxValue);
	$('#overlay_' + cardName).attr('style','opacity:1');
	vouchermap[cardName] = selectBoxValue;
	$('#checkbox_' + cardName).val(1);
	displayCumulativeAmount();
}

function displayCumulativeAmount() {
	var vouchers_cummulative_amount = 0;
	$.map( vouchermap, function( value, index ) {
		vouchers_cummulative_amount = (parseFloat(vouchers_cummulative_amount) + parseFloat(value));
	});	
	if(isCouponRedeemptionChargesEnabled != '' &&  isCouponRedeemptionChargesEnabled =='Y') {
		calculateTotalAmountIncludingServiceCharge(vouchers_cummulative_amount);
	}
	$('#vouchers_amount_display').html(vouchers_cummulative_amount);
}

function calculateTotalAmountIncludingServiceCharge(vouchersCummulativeAmount) {
	var redeemptionChargesPercent = $('#redeemptionChargesInPercent').val();
	var serviceChargeAmount = (parseFloat(vouchersCummulativeAmount) * parseFloat(redeemptionChargesPercent))/100;
	totalAmountIncludingCharges=parseFloat(serviceChargeAmount)+parseFloat(vouchersCummulativeAmount);
	$('#totalAmountIncludingCharges').html(totalAmountIncludingCharges+" /-");
	$('#summaryDetails').html("("+vouchersCummulativeAmount +" + "+redeemptionChargesPercent+"% charge = "+totalAmountIncludingCharges+" /-)");
}

function unFlip(cardName){
		$('#picked_' + cardName).hide();
		$('#pick_' + cardName).show();
		$('#selectedamount_' + cardName).html('');
		$('#overlay_' + cardName).removeAttr('style');
		delete vouchermap[cardName];
		$('#checkbox_' + cardName).val(0);
		displayCumulativeAmount();
}

function expandRedeemForm(){
	$('#redeemForm').show();
}

function closeRedeemForm(){
	$('#redeemForm').hide();
}

function validateAndSubmitVoucherForm(){
	cleanUpErrorDisplayDiv();
	var vouchers_amount = 0;
	$.map( vouchermap, function( value, index ) {
		vouchers_amount = (parseFloat(vouchers_amount) + parseFloat(value));
	});
	if(vouchers_amount <= 0){
		displayError('Please select atleast one voucher');
		return false;
	}
	var walletAmount = parseFloat(wallet_amount);
	if(walletAmount == '' || walletAmount == ' ' || walletAmount <= 0 ){
		displayError('No amount in your wallet, please do redeem to get some balance into your wallet');
		return false;
	}
	if(isCouponRedeemptionChargesEnabled != '' &&  isCouponRedeemptionChargesEnabled =='Y') {
		if(walletAmount < totalAmountIncludingCharges) {
			displayError('Selected voucher(s) amount is more than your wallet amount. Please recharge your wallet');
			return false;
		}
	}
	if(walletAmount < vouchers_amount){
		displayError('Selected voucher(s) amount is more than your wallet amount. Please do redeem to get some balance into your wallet');
		return false;
	}
	submitForm('couponsListWrapperForm','_finish','container');
}

function cleanUpErrorDisplayDiv(){
	$('#errorDisplayDivText').html('');
	$('#errorDisplayDiv').hide();
}

function displayError(msg){
	$('#errorDisplayDivText').html(' ' + msg + ' ');
	$('#errorDisplayDiv').show();
}
