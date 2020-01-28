require 'test_helper'

class CobrancasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cobranca = cobrancas(:one)
  end

  test "should get index" do
    get cobrancas_url
    assert_response :success
  end

  test "should get new" do
    get new_cobranca_url
    assert_response :success
  end

  test "should create cobranca" do
    assert_difference('Cobranca.count') do
      post cobrancas_url, params: { cobranca: { code_id: @cobranca.code_id, data: @cobranca.data, nome: @cobranca.nome, path: @cobranca.path, value: @cobranca.value } }
    end

    assert_redirected_to cobranca_url(Cobranca.last)
  end

  test "should show cobranca" do
    get cobranca_url(@cobranca)
    assert_response :success
  end

  test "should get edit" do
    get edit_cobranca_url(@cobranca)
    assert_response :success
  end

  test "should update cobranca" do
    patch cobranca_url(@cobranca), params: { cobranca: { code_id: @cobranca.code_id, data: @cobranca.data, nome: @cobranca.nome, path: @cobranca.path, value: @cobranca.value } }
    assert_redirected_to cobranca_url(@cobranca)
  end

  test "should destroy cobranca" do
    assert_difference('Cobranca.count', -1) do
      delete cobranca_url(@cobranca)
    end

    assert_redirected_to cobrancas_url
  end
end
