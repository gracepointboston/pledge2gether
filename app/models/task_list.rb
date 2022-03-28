class TaskList < ApplicationRecord
	serialize :list_of_tasks, Array
end
