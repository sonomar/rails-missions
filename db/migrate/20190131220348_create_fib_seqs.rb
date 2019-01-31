class CreateFibSeqs < ActiveRecord::Migration[5.2]
  def change
    create_table :fib_seqs do |t|
      t.integer :value, null: false
      t.integer :result, null: false
      t.string :runtime, null: false

      t.timestamps
    end
  end
end
