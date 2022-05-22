# README

This is my submission for the **Shopify Technical Challenge Submission for Backend Intern - fall 2022**.
Aside from the main task of creating a inventory tracking, I also implemented the "Ability to create warehouses/locations and assign inventory to specific locations".

This app is composed of three entities:

* **Products**: where all products properties are stored. Each product has many inventory items.

* **Warehouses**: where all warehouses properties are stored. Each warehouse has many inventory items.

* **Inventory items**: where all inventory items proerties are stored. Each inventory item belongs to a warehouse and a product.


To show an inventory tracking information, I created three alerts:

* **Expired**: this inventory item has expired, according to its expiration date.

* **Time for sale**: this inventory item should be on sale due to its expiration date being less or equal than 3 days from today.

* **None**: no alerts for this inventory item.
