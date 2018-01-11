package com.huaxin.xxshop.test;
import static com.huaxin.xxshop.util.XXShopUtil.*;
import org.junit.jupiter.api.Test;

public class TestUtils {
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

}
