defmodule PhoenixMDBootstrapForm.Mixfile do
  use Mix.Project

  @project_url "https://github.com/fbettag/phoenix_mdbootstrap_form"

  def project do
    [
      app:              :phoenix_mdbootstrap_form,
      version:          "0.0.1",
      elixir:           "~> 1.4",
      source_url:       @project_url,
      homepage_url:     @project_url,
      name:             "Phoenix Material Design Bootstrap Form",
      description:      "Material Design Bootstrap 4 Forms for Phoenix Applications",
      build_embedded:   Mix.env == :prod,
      start_permanent:  Mix.env == :prod,
      package:          package(),
      deps:             deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:phoenix_html, "~> 2.11"},
      {:phoenix,      "~> 1.4.10"},
      {:jason,        "~> 1.0"},
      {:ex_doc,       ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    "Format your application forms with Material Design Bootstrap markup."
  end

  defp package do
    [
      name:         "phoenix_mdbootstrap_form",
      maintainers:  ["Franz Bettag"],
      licenses:     ["MIT"],
      links:        %{"GitHub" => @project_url}
    ]
  end
end
