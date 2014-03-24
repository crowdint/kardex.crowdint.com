class CreateKardexUsers < ActiveRecord::Migration
  def change
    unless table_exists?(Kardex.user_table)
      create_table(Kardex.user_table)
    end

    unless column_exists?(Kardex.user_table, :email)
      add_column(Kardex.user_table, :email, :string, null: false)
    end

    unless column_exists?(Kardex.user_table, :name)
      add_column(Kardex.user_table, :name, :string)
    end

    unless column_exists?(Kardex.user_table, :department)
      add_column(Kardex.user_table, :department, :string)
    end

    unless column_exists?(Kardex.user_table, :active)
      add_column(Kardex.user_table, :active, :boolean)
    end

    unless column_exists?(Kardex.user_table, :access_token)
      add_column(Kardex.user_table, :access_token, :string)
    end
  end
end
