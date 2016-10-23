require 'test_helper'

class InboxTest < ActiveSupport::TestCase
  test "creates slug for new inbox" do
    i = Inbox.create name: "foo", remote_folder: "blah"
    assert_not_nil i.slug
  end
end
