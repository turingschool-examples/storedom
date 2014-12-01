class CreateTopSellingItemsView < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE VIEW top_selling_items AS
      SELECT "items".*,
      COUNT("order_items"."item_id") AS "orders_count"
      FROM "items" INNER JOIN "order_items" ON "order_items"."item_id" = "items"."id"
      GROUP BY items.id
      ORDER BY orders_count desc;
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW top_selling_items;
    SQL
  end
end
