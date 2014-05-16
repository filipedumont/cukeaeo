class ReviewProductPage
  include PageObject

  link(:rating1, :id => 'star_link_rating_1')
  link(:rating2, :id => 'star_link_rating_2')
  link(:rating3, :id => 'star_link_rating_3')
  link(:rating4, :id => 'star_link_rating_4')
  link(:rating5, :id => 'star_link_rating_5')

  text_field(:review_title, :id => 'BVRRFieldTextReviewTitleID')
  text_area(:review_body, :id => 'BVRRFieldTextAreaReviewTextID')
  text_field(:nick_name, :id => 'BVRRFieldTextReviewUsernicknameID')
  text_field(:zip_code, :id => 'BVRRFieldTextReviewZipID')

  button(:preview_submit, :id => 'BVRRPreviewReviewButtonID')
  button(:submit_review, :id => 'BVRRSubmitReviewButtonID')

  div(:submission_message, :id => 'BVRRSubmittedReviewContentID')

  def fill_basic_review
    sleep 5
    rating1

    self.review_title = 'test review title'
    self.review_body = 'test review body'
    begin
      self.nick_name = 'filipedumont'
    rescue => error
      if !error.message.include? 'locate element'
        raise error
      end
    end
    self.zip_code = 15203
    _select 'Pennsylvania'
    preview_submit

    sleep 3
    submit_review
  end

  def check_page
    submission_message.include?("Your valued opinion will help others find what they love, too.")
  end

  private
  def _select location
    Capybara.current_session.execute_script(
        "var list = $(\".selectList\");
      $(list).find(\"li:contains('#{location}')\").mousedown();"
    );
  end

end