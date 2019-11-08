defmodule PhoenixMDBootstrapFormTest do
  use ExUnit.Case
  import Phoenix.HTML

  doctest PhoenixMDBootstrapForm

  setup do
    conn = Phoenix.ConnTest.build_conn()
    form = Phoenix.HTML.FormData.to_form(conn, [as: :record, multipart: true])
    {:ok, [conn: conn, form: form]}
  end

  test "text_input", %{form: form} do
    input = PhoenixMDBootstrapForm.text_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="text">) <>
      ~s(</div></div>)
  end

  test "file_input", %{form: form} do
    input = PhoenixMDBootstrapForm.file_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="custom-file col-sm-10">) <>
      ~s(<input class="custom-file-input " id="record_value" name="record[value]" type="file">) <>
      ~s(<label class="custom-file-label"></label>) <>
      ~s(</div></div>)
  end

  test "email_input", %{form: form} do
    input = PhoenixMDBootstrapForm.email_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="email">) <>
      ~s(</div></div>)
  end

  test "password_input", %{form: form} do
    input = PhoenixMDBootstrapForm.password_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="password">) <>
      ~s(</div></div>)
  end

  test "textarea", %{form: form} do
    input = PhoenixMDBootstrapForm.textarea(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<textarea class="form-control " id="record_value" name="record[value]">\n</textarea>) <>
      ~s(</div></div>)
  end

  test "telephone_input", %{form: form} do
    input = PhoenixMDBootstrapForm.telephone_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="tel">) <>
      ~s(</div></div>)
  end

  test "select", %{form: form} do
    input = PhoenixMDBootstrapForm.select(form, :value, ["option"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<select class="form-control " id="record_value" name="record[value]">) <>
      ~s(<option value="option">option</option>) <>
      ~s(</select></div></div>)
  end

  test "multiple_select", %{form: form} do
    input = PhoenixMDBootstrapForm.multiple_select(form, :value, ["option1", "option2"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<select class="form-control " id="record_value" name="record[value]" multiple>) <>
      ~s(<option value="option1">option1</option>) <>
      ~s(<option value="option2">option2</option>) <>
      ~s(</select></div></div>)
  end

  test "checkbox", %{form: form} do
    input = PhoenixMDBootstrapForm.checkbox(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<div class="col-sm-10 ml-auto">) <>
      ~s(<div class="form-check ">) <>
      ~s(<input name="record[value]" type="hidden" value="false">) <>
      ~s(<input class="form-check-input " id="record_value" name="record[value]" type="checkbox" value="true">) <>
      ~s(<label class="form-check-label" for="record_value">Value</label>) <>
      ~s(</div></div></div>)
  end

  test "radio_buttons", %{form: form} do
    input = PhoenixMDBootstrapForm.radio_buttons(form, :value, ["red", "green"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<span class="col-form-label col-sm-2 text-sm-right">Value</span>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_red" name="record[value]" type="radio" value="red">) <>
      ~s(<label class="form-check-label" for="record_value_red">Red</label>) <>
      ~s(</div>) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_green" name="record[value]" type="radio" value="green">) <>
      ~s(<label class="form-check-label" for="record_value_green">Green</label>) <>
      ~s(</div>) <>
      ~s(</div></div>)
  end

  test "radio_buttons with custom labels", %{form: form} do
    input = PhoenixMDBootstrapForm.radio_buttons(form, :value, [{"R", "red"}, {"G", "green"}])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<span class="col-form-label col-sm-2 text-sm-right">Value</span>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_red" name="record[value]" type="radio" value="red">) <>
      ~s(<label class="form-check-label" for="record_value_red">R</label>) <>
      ~s(</div>) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_green" name="record[value]" type="radio" value="green">) <>
      ~s(<label class="form-check-label" for="record_value_green">G</label>) <>
      ~s(</div>) <>
      ~s(</div></div>)
  end

  test "radio_buttons with inline", %{form: form} do
    input = PhoenixMDBootstrapForm.radio_buttons(form, :value, ["red", "green"], input: [inline: true])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<span class="col-form-label col-sm-2 text-sm-right">Value</span>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<div class="form-check form-check-inline">) <>
      ~s(<input class="form-check-input " id="record_value_red" name="record[value]" type="radio" value="red">) <>
      ~s(<label class="form-check-label" for="record_value_red">Red</label>) <>
      ~s(</div>) <>
      ~s(<div class="form-check form-check-inline">) <>
      ~s(<input class="form-check-input " id="record_value_green" name="record[value]" type="radio" value="green">) <>
      ~s(<label class="form-check-label" for="record_value_green">Green</label>) <>
      ~s(</div>) <>
      ~s(</div></div>)
  end

  test "checkboxes", %{form: form} do
    input = PhoenixMDBootstrapForm.checkboxes(form, :value, ["red", "green"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<span class="col-form-label col-sm-2 text-sm-right">Value</span>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_red" name="record[value][]" type="checkbox" value="red">) <>
      ~s(<label class="form-check-label" for="record_value_red">Red</label>) <>
      ~s(</div>) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_green" name="record[value][]" type="checkbox" value="green">) <>
      ~s(<label class="form-check-label" for="record_value_green">Green</label>) <>
      ~s(</div>) <>
      ~s(</div></div>)
  end

  test "checkboxes selected", %{form: form} do
    input = PhoenixMDBootstrapForm.checkboxes(form, :value, ["red", "green"], selected: ["red"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<span class="col-form-label col-sm-2 text-sm-right">Value</span>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_red" name="record[value][]" type="checkbox" value="red" checked>) <>
      ~s(<label class="form-check-label" for="record_value_red">Red</label>) <>
      ~s(</div>) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input " id="record_value_green" name="record[value][]" type="checkbox" value="green">) <>
      ~s(<label class="form-check-label" for="record_value_green">Green</label>) <>
      ~s(</div>) <>
      ~s(</div></div>)
  end

  test "submit", %{form: form} do
    input = PhoenixMDBootstrapForm.submit(form)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<div class="col-sm-10 ml-auto">) <>
      ~s(<button class="btn" type="submit">Submit</button>) <>
      ~s(</div></div>)
  end

  test "submit with label", %{form: form} do
    input = PhoenixMDBootstrapForm.submit(form, "Smash")
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<div class="col-sm-10 ml-auto">) <>
      ~s(<button class="btn" type="submit">Smash</button>) <>
      ~s(</div></div>)
  end

  test "submit with alternative", %{form: form} do
    input = PhoenixMDBootstrapForm.submit(form, "Smash", alternative: "Cancel")
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<div class="col-sm-10 ml-auto">) <>
      ~s(<button class="btn" type="submit">Smash</button>) <>
      ~s(Cancel) <>
      ~s(</div></div>)
  end

  test "static", %{form: form} do
    input = PhoenixMDBootstrapForm.static(form, "Label", "Content")
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right">Label</label>) <>
      ~s(<div class="form-control-plaintext col-sm-10">Content</div>) <>
      ~s(</div>)
  end

  test "with custom class", %{form: form} do
    input = PhoenixMDBootstrapForm.text_input(form, :value, input: [class: "custom"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control  custom" id="record_value" name="record[value]" type="text">) <>
      ~s(</div></div>)
  end

  test "with custom label", %{form: form} do
    input = PhoenixMDBootstrapForm.text_input(form, :value, label: [text: "Custom"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Custom</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="text">) <>
      ~s(</div></div>)
  end

  test "with help attribute", %{form: form} do
    input = PhoenixMDBootstrapForm.text_input(form, :value, input: [help: "help text"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="text">) <>
      ~s(<small class="form-text text-muted">help text</small>) <>
      ~s(</div></div>)
  end

  test "with custom grid", %{conn: conn} do
    opts  = [as: :record, label_col: "col-sm-3 col-form-label", control_col: "col-sm-9", label_align: "text-sm-left"]
    form  = Phoenix.HTML.FormData.to_form(conn, opts)
    input = PhoenixMDBootstrapForm.text_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-sm-3 col-form-label text-sm-left" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-9">) <>
      ~s(<input class="form-control " id="record_value" name="record[value]" type="text">) <>
      ~s(</div></div>)
  end

  test "with errors", %{form: form} do
    error = [value: {"Some error", []}]
    form = %Phoenix.HTML.Form{form | errors: error}
    input = PhoenixMDBootstrapForm.text_input(form, :value)
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<label class="col-form-label col-sm-2 text-sm-right" for="record_value">Value</label>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<input class="form-control is-invalid" id="record_value" name="record[value]" type="text">) <>
      ~s(<div class="invalid-feedback">Some error</div>) <>
      ~s(</div></div>)
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

  test "with errors for radio buttons", %{form: form} do
    error = [value: {"Some error", []}]
    form = %Phoenix.HTML.Form{form | errors: error}
    input = PhoenixMDBootstrapForm.radio_buttons(form, :value, ["A", "B"])
    assert safe_to_string(input) ==
      ~s(<div class="form-group row">) <>
      ~s(<span class="col-form-label col-sm-2 text-sm-right">Value</span>) <>
      ~s(<div class="col-sm-10">) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input is-invalid" id="record_value_A" name="record[value]" type="radio" value="A">) <>
      ~s(<label class="form-check-label" for="record_value_A">A</label>) <>
      ~s(</div>) <>
      ~s(<div class="form-check ">) <>
      ~s(<input class="form-check-input is-invalid" id="record_value_B" name="record[value]" type="radio" value="B">) <>
      ~s(<label class="form-check-label" for="record_value_B">B</label>) <>
      ~s(<div class="invalid-feedback">Some error</div>) <>
      ~s(</div></div></div>)
  end
end
