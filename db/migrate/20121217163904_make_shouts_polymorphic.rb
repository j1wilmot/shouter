class MakeShoutsPolymorphic < ActiveRecord::Migration
  def up
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer

    select_all("SELECT * FROM shouts").each do |shout|
      text_shout_id = insert <<-SQL
        INSERT INTO text_shouts(body)
        VALUES (#{quote(shout["body"])}) 
      SQL
      update <<-SQL
        UPDATE shouts
        SET content_type = 'TextShout'
            content_id   = #{text_shout_id}
        WHERE id = #{shout["id"]}
      SQL
    end

    remove_column :shouts, :body
  end

  def down
    add_column :shouts, :body, :string

    select_all("SELECT * FROM text_shouts").each do |text_shout|
      update <<-SQL
        UPDATE shouts
        SET body = #{quote(text_shout["body"])}
        WHERE id = #{text_shout["id"]}
      SQL
    end

    delete("DELETE FROM text_shouts")
    remove_column :shouts, :content_id
    remove_column :shouts, :content_type
  end
end
