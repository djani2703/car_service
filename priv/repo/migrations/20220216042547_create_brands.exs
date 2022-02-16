defmodule CarService.Repo.Migrations.CreateBrands do
  use Ecto.Migration

  def change do
    create table(:brands, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:brands, [:name], name: :index_for_unique_name)
  end
end
