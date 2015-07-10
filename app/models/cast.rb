class Cast < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :cast_transitions, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :desc, -> { order(created_at: :desc) }
  scope :find_by_param, -> (param) { find(param) }
  scope :most_recent, -> { desc.limit(10) }
  scope :by_user, -> (user_id) { where(user_id: user_id) }

  validates_presence_of :name, :url
  validate :regular_url

  auto_html_for :url do
    youtube(width: "100%", height: 550, autoplay: true)
  end

  def state_machine
    @state_machine ||= CastStateMachine.new(self, transition_class: CastTransition)
  end

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state_machine

  private
    def regular_url
      errors.add(:url, :bad_url) unless is_valid_url?
    end

    def is_valid_url?
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
      rescue URI::InvalidURIError
        false
    end

end
