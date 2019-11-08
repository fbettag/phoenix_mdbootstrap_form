defmodule PhoenixMDBootstrapForm.Mixfile do
  use Mix.Project

  @project_url "https://github.com/fbettag/phoenix_mdbootstrap_form"

  def project do
	{tag, description} = git_version()
    [
      app:              :phoenix_mdbootstrap_form,
      version:          tag,
      elixir:           "~> 1.4",
      source_url:       @project_url,
      homepage_url:     @project_url,
      name:             "Phoenix Material Design Bootstrap Form",
      description:      "Material Design Bootstrap 4 Forms for Phoenix Applications " <> description,
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
      {:ex_doc,       "~> 0.19", only: :dev}
    ]
  end

  defp package do
    [
      name:         "phoenix_mdbootstrap_form",
      maintainers:  ["Franz Bettag"],
      licenses:     ["MIT"],
      links:        %{"GitHub" => @project_url}
    ]
  end

  defp git_version() do
    # pulls version information from "nearest" git tag or sha hash-ish
    {hashish, 0} =
      System.cmd("git", ~w[describe --dirty --abbrev=7 --tags --always --first-parent])

    full_version = String.trim(hashish)

    tag_version =
      hashish
      |> String.split("-")
      |> List.first()
      |> String.replace_prefix("v", "")
      |> String.trim()

    tag_version =
      case Version.parse(tag_version) do
        :error -> "0.0.0-#{tag_version}"
        _ -> tag_version
      end

    {tag_version, full_version}
  end
end
