# Copyright 2014 Cognitect. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS-IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Transit
  module Marshaler

    module JsonBase
      def default_opts
        {:prefer_strings => true,
          :max_int       => JSON_MAX_INT,
          :min_int       => JSON_MIN_INT}
      end
    end

    # @api private
    class Json
      include Transit::Marshaler::Base
      include Transit::Marshaler::JsonBase

      def initialize(io, opts)
        parse_options(default_opts.merge(opts))
      end
    end

    # @api private
    class VerboseJson
      include Transit::Marshaler::Base
      include Transit::Marshaler::JsonBase
      include Transit::Marshaler::VerboseHandlers

      def initialize(io, opts)
        parse_options(default_opts.merge(opts))
      end
    end
  end
end
