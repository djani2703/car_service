defmodule CarService.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :model, :string, null: false
      add :year, :integer, null: false
      add :body_type, :string, null: false
      add :is_electric, :boolean, null: false
      add :brand_id, references(:brands, type: :uuid, on_delete: :nothing), null: false

      timestamps()
    end
  end
end
