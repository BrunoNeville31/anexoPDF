require "application_system_test_case"

class CobrancasTest < ApplicationSystemTestCase
  setup do
    @cobranca = cobrancas(:one)
  end

  test "visiting the index" do
    visit cobrancas_url
    assert_selector "h1", text: "Cobrancas"
  end

  test "creating a Cobranca" do
    visit cobrancas_url
    click_on "New Cobranca"

    fill_in "Code", with: @cobranca.code_id
    fill_in "Data", with: @cobranca.data
    fill_in "Nome", with: @cobranca.nome
    fill_in "Path", with: @cobranca.path
    fill_in "Value", with: @cobranca.value
    click_on "Create Cobranca"

    assert_text "Cobranca was successfully created"
    click_on "Back"
  end

  test "updating a Cobranca" do
    visit cobrancas_url
    click_on "Edit", match: :first

    fill_in "Code", with: @cobranca.code_id
    fill_in "Data", with: @cobranca.data
    fill_in "Nome", with: @cobranca.nome
    fill_in "Path", with: @cobranca.path
    fill_in "Value", with: @cobranca.value
    click_on "Update Cobranca"

    assert_text "Cobranca was successfully updated"
    click_on "Back"
  end

  test "destroying a Cobranca" do
    visit cobrancas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cobranca was successfully destroyed"
  end
end
