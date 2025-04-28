require "application_system_test_case"

class OpportunitiesTest < ApplicationSystemTestCase
  setup do
    @opportunity = opportunities(:one)
  end

  test "visiting the index" do
    visit opportunities_url
    assert_selector "h1", text: "Opportunities"
  end

  test "should create opportunity" do
    visit opportunities_url
    click_on "New opportunity"

    fill_in "Description", with: @opportunity.description
    fill_in "End date", with: @opportunity.end_date
    fill_in "Location", with: @opportunity.location
    fill_in "Skills required", with: @opportunity.skills_required
    fill_in "Start date", with: @opportunity.start_date
    fill_in "Title", with: @opportunity.title
    fill_in "User", with: @opportunity.user_id
    click_on "Create Opportunity"

    assert_text "Opportunity was successfully created"
    click_on "Back"
  end

  test "should update Opportunity" do
    visit opportunity_url(@opportunity)
    click_on "Edit this opportunity", match: :first

    fill_in "Description", with: @opportunity.description
    fill_in "End date", with: @opportunity.end_date.to_s
    fill_in "Location", with: @opportunity.location
    fill_in "Skills required", with: @opportunity.skills_required
    fill_in "Start date", with: @opportunity.start_date.to_s
    fill_in "Title", with: @opportunity.title
    fill_in "User", with: @opportunity.user_id
    click_on "Update Opportunity"

    assert_text "Opportunity was successfully updated"
    click_on "Back"
  end

  test "should destroy Opportunity" do
    visit opportunity_url(@opportunity)
    accept_confirm { click_on "Destroy this opportunity", match: :first }

    assert_text "Opportunity was successfully destroyed"
  end
end
