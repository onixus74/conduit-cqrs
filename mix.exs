defmodule Conduit.Mixfile do
  use Mix.Project

  def project do
    [
      app: :conduit,
      version: "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application() do
    [mod: {Conduit.Application, []}, extra_applications: [:eventstore]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:bcrypt_elixir, "~> 1.0"},
      {:comeonin, "~> 4.0"},
      {:commanded, "~> 1.0"},
      {:commanded_ecto_projections, "~> 1.0"},
      {:commanded_eventstore_adapter, "~> 1.0"},
      {:eventstore, "~> 1.0"},
      {:cors_plug, "~> 1.4"},
      {:elixir_uuid, "~> 1.2"},
      {:plug_cowboy, "~> 1.0"},
      {:exconstructor, "~> 1.1"},
      {:ex_machina, "~> 2.1", only: :test},
      {:gettext, "~> 0.11"},
      {:guardian, "~> 1.2"},
      {:jason, "~> 1.1.2"},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
      {:phoenix, "~> 1.4"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.11"},
      {:postgrex, ">= 0.0.0"},
      {:slugger, "~> 0.2"},
      {:vex, "~> 0.6"}
    ]
  end

  defp aliases do
    [
      "event_store.init": ["event_store.drop", "event_store.create", "event_store.init"],
      "ecto.init": ["ecto.drop", "ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      reset: ["event_store.init", "ecto.init"],
      test: ["reset", "test"]
    ]
  end
end
