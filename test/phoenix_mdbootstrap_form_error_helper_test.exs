defmodule PhoenixMDBootstrapFormErrorHelperTest do
  use ExUnit.Case
  import Phoenix.HTML

  doctest PhoenixMDBootstrapForm

  setup do
    Application.put_env(:phoenix_bootstrap_form, :translate_error_function, fn {msg, opts} ->
      "#{msg}, #{opts[:count]}"
    end)
    conn = Phoenix.ConnTest.build_conn()
    form = Phoenix.HTML.FormData.to_form(conn, [as: :record, multipart: true])
    {:ok, [conn: conn, form: form]}
  end

  test "with dynamic errors", %{form: form} do
    error = [value: {"Got errors - %{count}", [count: 10]}]
    form = %Phoenix.HTML.Form{form | errors: error}
    input = PhoenixMDBootstrapForm.text_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control is-invalid" id="record_value" name="record[value]" type="text">) <>
      ~s(<div class="invalid-feedback">Got errors - 10</div>) <>
      ~s(</div></div>)
  end
end
