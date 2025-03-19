# amazon-order-update-script
This script ensures that the data in your amazonorder_stagging table (secondary) is synchronized with the primary table (AmazonOrderTest).
The primary focus is to update only the records where the status has changed and the primary table has the latest updates, preserving data accuracy.
