#property copyright "Copyright 2016, Lukasz Paszke"
#property link      "https://github.com/lukaszp/metaquotes-4-tools"
#property version   "1.00"


string StocksSymbols[] = {
                                  "FCORN",
                               "FSOYBEAN",
                                 "FWHEAT",
                                   "FOIL",
                                  "FRICE",
                                  "FGOLD",
                                "FCOPPER",
                                "FNATGAS",
                                 "FUS500",
                                 "FUS100",
                                 "FJP225",
                                  "FDE30",
                                  "FCN40",
                                  "FHK45",
                                  "FEU50",
                                  "FFR40",
                                  "FNL25",
                                  "FTNOTE10",
                                  "FBUND10",
                                  "FOAT10"};

int StocksSymbolsNumber = ArraySize(StocksSymbols);

string file_name = "bossafx_mikro_instrum_spec.space";


void OnStart()
   {

   if (StringCompare(AccountInfoString(ACCOUNT_COMPANY), "Dom Maklerski Banku Ochrony Srodowiska S.A.") != 0)
        {
           Print("Error: Wrong account company", AccountInfoString(ACCOUNT_COMPANY));
           return;
        }

   int file_handle = FileOpen("mql_data\\" + file_name, FILE_WRITE|FILE_CSV, ",");

   if (file_handle < 0)
      {
      Print("Failed to open the file by the absolute path");
      Print("Error code ", GetLastError());
      return;
      }

   FileWrite(file_handle,
      "Symbol",
      "The last incoming tick time",
      "Tick size in the ?quote currency?",
      "Point size in the quote currency",
      "Spread value in points",
      "Lot size in the base currency",
      "Minimum permitted amount of a lot",
      "Maximum permitted amount of a lot",
      "Swap of the buy order",
      "Swap of the sell order",
      "Free margin required to open 1 lot for buying",
      "Tick value in the deposit currency",
      "Step for changing lots",
      "Last incoming bid price",
      "Last incoming ask price");

      FileWrite(file_handle,
         "symbol",
         "last_act_time",
         "tick_size",
         "point_size",
         "spread_in_p",
         "lot_in_base_curr",
         "min_trade_in_lot",
         "max_trade_in_lot",
         "buy_swap",
         "sell_swap",
         "lot_free_margin",
         "tick_in_dep_curr",
         "lots_step",
         "last_bid_price",
         "last_ask_price");


   for (int current_symbol = 0; current_symbol < StocksSymbolsNumber; current_symbol++)
      {
      FileWrite(file_handle,
         StocksSymbols[current_symbol],
         MarketInfo(StocksSymbols[current_symbol],MODE_TIME),
         MarketInfo(StocksSymbols[current_symbol],MODE_TICKSIZE),
         MarketInfo(StocksSymbols[current_symbol],MODE_POINT),
         MarketInfo(StocksSymbols[current_symbol],MODE_SPREAD),
         MarketInfo(StocksSymbols[current_symbol],MODE_LOTSIZE),
         MarketInfo(StocksSymbols[current_symbol],MODE_MINLOT),
         MarketInfo(StocksSymbols[current_symbol],MODE_MAXLOT),
         MarketInfo(StocksSymbols[current_symbol],MODE_SWAPLONG),
         MarketInfo(StocksSymbols[current_symbol],MODE_SWAPSHORT),
         MarketInfo(StocksSymbols[current_symbol],MODE_MARGINREQUIRED),
         MarketInfo(StocksSymbols[current_symbol],MODE_TICKVALUE),
         MarketInfo(StocksSymbols[current_symbol],MODE_LOTSTEP),
         MarketInfo(StocksSymbols[current_symbol],MODE_BID),
         MarketInfo(StocksSymbols[current_symbol],MODE_ASK));
      }

      FileClose(file_handle);
   }
//+------------------------------------------------------------------+
