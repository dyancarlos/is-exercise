require 'rails_helper'

RSpec.describe "Courses Feature", type: :feature do

  it "showing courses" do
    visit courses_path
    expect(page).to have_content "Cursos"
  end

  it "show form courses" do
    visit courses_path
    click_link "Criar Curso"
    expect(page).to have_content "Novo Curso"
  end

  it "create a valid course" do
    visit new_course_path

    fill_in "Nome", with: "Ingles"
    fill_in "Descrição", with: "Curso de Ingles"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Curso foi criado com sucesso"
  end

  it "create with a blank name" do
    visit new_course_path

    fill_in "Nome", with: ""
    fill_in "Descrição", with: "Curso de Ingles"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Nome não pode ficar em branco"
  end

  it "create with a blank description" do
    visit new_course_path

    fill_in "Nome", with: "Ingles"
    fill_in "Descrição", with: ""
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Descrição não pode ficar em branco"
  end

  it "create with a name longer than 45 characters" do
    visit new_course_path

    fill_in "Nome", with: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos"
    fill_in "Descrição", with: "Curso de Ingles"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Nome é muito longo (máximo: 45 caracteres)"
  end

  it "create with a description longer than 45 characters" do
    visit new_course_path

    fill_in "Nome", with: "Ingles"
    fill_in "Descrição", with: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Descrição é muito longo (máximo: 45 caracteres)"
  end

  it "create with blank fields" do
    visit new_course_path

    fill_in "Nome", with: ""
    fill_in "Descrição", with: ""
    click_button "Salvar"

    expect(page).to have_content "Nome não pode ficar em branco"
    expect(page).to have_content "Descrição não pode ficar em branco"
  end

end
