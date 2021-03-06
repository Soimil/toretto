defmodule Hefty.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  # Make order
  # https://github.com/binance-exchange/binance-official-api-docs/blob/master/rest-api.md#new-order--trade
  # https://github.com/binance-exchange/binance-official-api-docs/blob/master/rest-api.md#current-open-orders-user_data
  #
  # Get open orders
  # {
  #   "symbol": "LTCBTC",
  #   "orderId": 1,
  #   "clientOrderId": "myOrder1",
  #   "price": "0.1",
  #   "origQty": "1.0",
  #   "executedQty": "0.0",
  #   "cummulativeQuoteQty": "0.0",
  #   "status": "NEW",
  #   "timeInForce": "GTC",
  #   "type": "LIMIT",
  #   "side": "BUY",
  #   "stopPrice": "0.0",
  #   "icebergQty": "0.0",
  #   "time": 1499827319559,
  #   "updateTime": 1499827319559,
  #   "isWorking": true
  # }

  def change do
    create table(:orders, primary_key: false) do
      add :id, :uuid, primary_key: true
      add(:symbol_id, references(:pairs, type: :uuid)) # uuid of LTCBTC
      add :order_id, :integer
      add :client_order_id, :text
      add :price, :text
      add :original_quantity, :text
      add :executed_quantity, :text
      add :cummulative_quote_quantity, :text
      add :status, :text
      add :time_in_force, :text # GTC
      add :type, :text # LIMIT, MARKET, STOP_LOSS
      add :side, :text # BUY or SELL
      add :stop_price, :text
      add :iceberg_quantity, :text
      add :time, :integer
      add :update_time, :integer
      add :is_working, :boolean

      timestamps()
    end
  end
end
