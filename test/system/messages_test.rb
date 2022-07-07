require_relative "../application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  
  # тест на создание сообщения
  test "test should create Message" do
    visit messages_path
    
    click_on "Создать новое письмо"

    fill_in "Текст письма", with: "Creating body"
    fill_in "User", with: "4"

    click_on "Создать"
  end
  
  # тест на определение хендлера текста на главной странице
  test "visiting the index" do
    visit messages_path
    assert_selector "h2", text: "Все письма"
    assert_selector "p", text: "Создать новое письмо"
    Message.all do |message|
      assert_selector "p", text: "Письмо #{message.id}"
    end
  end

  # тест на изменение письма
  test "test should change message" do
    visit messages_path
    Message.all do |message|
      click_on "Письмо #{message.id}"
    
      click_on fa_icon('pencil')
      fill_in "Текст письма", with: "Creating body"
      fill_in "User", with: "4"

      click_on "Сохранить"
    end
  end

  # тест на удаление письма
  test "test should destroy message" do
    visit messages_path

    Message.all do |message|
      click_on "Письмо #{message.id}"
      click_on "Удалить письмо"
    end
  end

end
