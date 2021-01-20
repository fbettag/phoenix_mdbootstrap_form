defmodule PhoenixMDBootstrapForm.Mixfile do
  use Mix.Project

  @project_url "https://github.com/fbettag/phoenix_mdbootstrap_form.ex"

  def project do
    [
      app: :phoenix_mdbootstrap_form,
      version: "0.1.2",
      elixir: "~> 1.7",
      source_url: @project_url,
      homepage_url: @project_url,
      name: "Phoenix Material Design Bootstrap Form",
      description: "Material Design Bootstrap 4 Forms for Phoenix Applications",
      package: package(),
      aliases: aliases(),
      deps: deps()
    ]
  end

  defp package do
    [
      name: "phoenix_mdbootstrap_form",
      maintainers: ["Franz Bettag"],
      licenses: ["MIT"],
      links: %{"GitHub" => @project_url},
      files: ~w(lib LICENSE README.md mix.exs)
    ]
  end

  defp aliases do
    [test: ["test", "credo -a --strict"]]
  end

  defp deps do
    [
      {:phoenix_html, "~> 2.14"},
      {:phoenix, "~> 1.5"},
      {:ex_doc, "~> 0.19", only: :dev},
      {:credo, github: "rrrene/credo", only: [:dev, :test]}
    ]
  end
end
