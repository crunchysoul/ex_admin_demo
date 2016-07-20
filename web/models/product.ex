defmodule ExAdminDemo.Product do
  use ExAdminDemo.Web, :model

  schema "products" do
    field :title, :string
    field :description, :string
    field :author, :string
    field :price, :decimal
    field :featured, :boolean, default: false
    field :available_on, Ecto.Date
    field :image_file_name, ExAdminDemo.Image.Type

    timestamps
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(title description author price featured available_on image_file_name))
    |> validate_required(~w(title description author price featured)a)
  end
end
