require 'test_helper'

class CiMailerTest < ActionMailer::TestCase
  test "revalidar_servidor" do
    mail = CiMailer.revalidar_servidor
    assert_equal "Revalidar servidor", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
