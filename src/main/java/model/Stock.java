package model;

import java.util.HashSet;

public class Stock {

    private HashSet<Item> items;

    public Stock() {
        items = initItems();
    }

    private HashSet<Item> initItems() {
        HashSet<Item> items = new HashSet<>();
        items.add(new Item(1, "Coffee", 12));
        items.add(new Item(2, "Tea", 10));
        items.add(new Item(3, "Beer", 15));
        return items;
    }

    public HashSet<Item> getItems() {
        return items;
    }

    public Item getItem(int id){
        return items.stream().filter(e -> e.getId() == id).findFirst().orElse(null);

    }


}
