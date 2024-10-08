# frozen_string_literal: true

#
# Copyright (C) 2024 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require_relative "../../common"

class TeacherViewPageV2
  class << self
    include SeleniumDependencies

    # Selectors
    def details_tab
      fj("div[role='tab']:contains('Details')")
    end

    def assignment_type
      f("#AssignmentType")
    end

    # Methods & Actions
    def visit(course, assignment)
      course.account.enable_feature!(:assignment_enhancements_teacher_view)
      get "/courses/#{course.id}/assignments/#{assignment.id}"
      wait_for(method: nil, timeout: 1) do
        assignment_type
      end
    end

    def assignment_title(title)
      fj("h1:contains(#{title})")
    end
  end
end
