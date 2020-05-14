% DATA line example: 2018.10.01,10:45,2936.54,2936.78,2936.53,2936.78,4

clear

stocks_symbols = {};

    [date_str hour_str stock_open stock_high stock_low stock_close] = textread(['mq4_files/FUS500.5.csv.example'], '%s %s %f %f %f %f %*d', 'headerlines', 0, 'delimiter', ',');
    quotes = double([stock_open stock_high stock_low stock_close]);
 
save('quotes.mat', 'quotes');