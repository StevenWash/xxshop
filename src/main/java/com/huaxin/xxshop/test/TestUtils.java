package com.huaxin.xxshop.test;

import static com.huaxin.xxshop.util.XXShopUtil.*;
import com.huaxin.xxshop.entity.Address;
import com.huaxin.xxshop.service.AddressService;
import com.huaxin.xxshop.service.impl.AddressServiceImpl;
import org.junit.jupiter.api.Test;

public class TestUtils {

    public static void main(String[] args) {
        String str = "/Users/yin/Documents/Git/GitHub/Local/xxshop/target/xxshop/";
        String path = str.substring(0,str.lastIndexOf("target"));
        path += "src/main/webapp/goodsimage";
        System.out.println(path);
        System.out.println("4fe197efa85d42a18a44fc5574b2db95".length());
    }


    @Test
    public void testGetNow() {
        String str = getId();
        System.out.println("length: "+str.length()+"\n"+str);

    }

    @Test
    public void testgetNow() {
        String now = getNow();
        System.out.println("length: "+now.length()+"\n"+now);
    }

    @Test
    public void testGetGoodsNo() {
        String goodNo = getGoodsNo();
        System.out.println("length: "+goodNo.length()+"\n"+goodNo);
    }

    @Test
    public void testGetAddressById(){
        String addressId = "14a16cd98f4d4b879272d32937f08409";
        AddressService addressService = new AddressServiceImpl();
        Address address = addressService.getAddressById(addressId);
        System.out.println(address);
    }


}
