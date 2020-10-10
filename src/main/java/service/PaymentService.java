package service;

import model.Cart;
import model.Item;

public class PaymentService {

    public static Cart cart = new Cart();

    public static double totalPrice(){
        return cart.getItems().stream().mapToDouble(Item::getPrice).sum();
    }

}
