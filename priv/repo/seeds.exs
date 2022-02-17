# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CarService.Repo.insert!(%CarService.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CarService.Repo
alias CarService.CarBrand
alias CarService.CarBrand.Brand
alias CarService.CarInfo.Car

Repo.delete_all(Car)
Repo.delete_all(Brand)

Enum.each(
  ["Audi", "Mercedes", "Tesla", "Volkswagen"],
  &CarBrand.create_brand(%{name: &1})
)
