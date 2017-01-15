class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.string :income
      t.string :address_years
      t.string :company_years
      t.string :marital_status
      t.string :requested_amount
      t.string :payment_terms
      t.string :bank
      t.string :comment
      t.string :company_name
      t.string :company_phone_number
      t.string :dependents_number
      t.string :company_position
      t.string :has_sgmm
      t.string :has_imss
      t.string :has_car
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
