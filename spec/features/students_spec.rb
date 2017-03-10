require 'rails_helper'

RSpec.describe "Students Feature", type: :feature do

  it "create a valid student" do
    visit new_student_path

    fill_in "Nome", with: "Ingles"
    fill_in "Matrícula", with: "1234567890"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Estudante foi criado com sucesso"
  end

  it "create with a blank name" do
    visit new_student_path

    fill_in "Nome", with: ""
    fill_in "Matrícula", with: "1234567890"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Nome não pode ficar em branco"
  end

  it "create with a blank register_number" do
    visit new_student_path

    fill_in "Nome", with: "Ingles"
    fill_in "Matrícula", with: ""
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Matrícula não pode ficar em branco"
  end

  it "create with a name longer than 45 characters" do
    visit new_student_path

    fill_in "Nome", with: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos"
    fill_in "Matrícula", with: "1234567890"
    select "Ativo", from: "Status"
    click_button "Salvar"

    expect(page).to have_content "Nome é muito longo (máximo: 45 caracteres)"
  end

  it "create with blank fields" do
    visit new_student_path

    fill_in "Nome", with: ""
    fill_in "Matrícula", with: ""
    click_button "Salvar"

    expect(page).to have_content "Nome não pode ficar em branco"
    expect(page).to have_content "Matrícula não pode ficar em branco"
  end

end
