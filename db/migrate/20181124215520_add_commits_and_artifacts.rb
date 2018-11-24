class AddCommitsAndArtifacts < ActiveRecord::Migration[5.2]
  def change
    create_table :commits do |t|
      t.string :uid, null: false, index: true
      t.string :author, default: '', null: false
      t.string :author_email, default: '', null: false
      t.string :summary, default: '', null: false
      t.string :description, default: '', null: false
    end

    create_table :artifacts do |t|
      t.references :commit
      t.integer :build_type, null: false
      t.integer :status, null: false
      t.string :permalink
    end
  end
end
