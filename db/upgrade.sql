delete from coupons_catalogue where id=4;
insert into coupons_catalogue values(4, 0, 'FOOD PANDA', 'http://localhost:5353/resources/img/fp.jpg', 'http://localhost:5353/resources/img/fp.jpg', 'http://localhost:5353/resources/img/fp.jpg', 'snapdeal description snapdeal descriptionsnapdeal description');
insert into coupons_catalogue values(5, 0, 'EBAY', 'http://localhost:5353/resources/img/ebay.jpg', 'http://localhost:5353/resources/img/ebay.jpg', 'http://localhost:5353/resources/img/ebay.jpg', 'FLipkart couponFLipkart couponFLipkart coupon');
insert into coupons_catalogue values(6, 0, 'SNAPDEAL', 'http://localhost:5353/resources/img/sd.jpg', 'http://localhost:5353/resources/img/sd.jpg', 'http://localhost:5353/resources/img/sd.jpg', 'snapdeal description snapdeal descriptionsnapdeal description');
update coupons_catalogue set image_b_url='http://localhost:5353/resources/img/flipkart.jpg' where name='FLIPKART';
update coupons_catalogue set image_m_url='http://localhost:5353/resources/img/flipkart.jpg' where name='FLIPKART';
update coupons_catalogue set image_s_url='http://localhost:5353/resources/img/flipkart.jpg' where name='FLIPKART';
update coupons_catalogue set image_b_url='http://localhost:5353/resources/img/amazon.png' where name='AMAZON';
update coupons_catalogue set image_m_url='http://localhost:5353/resources/img/amazon.png' where name='AMAZON';
update coupons_catalogue set image_s_url='http://localhost:5353/resources/img/amazon.png' where name='AMAZON';

alter table transaction drop column buyer_email;
alter table transaction drop column buyer_name;
alter table transaction add column buyer_id bigint(20);
alter table transaction add column coupon_id varchar(255);


alter table users add column otp bigint(10);
alter table users add column otp_expiry timestamp null;
alter table users modify column amount float;