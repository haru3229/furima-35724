class CreateBuyerOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_orders do |t|

      t.timestamps
    end
  end
end
