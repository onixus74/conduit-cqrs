defmodule Conduit.Accounts.Projections.User do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "accounts_users" do
    field :username, :string, unique: true
    field :email, :string, unique: true
    field :hashed_password, :string

    timestamps()
  end
end
