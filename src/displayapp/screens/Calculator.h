#pragma once

#include "displayapp/screens/Screen.h"
#include <lvgl/lvgl.h>

namespace Pinetime {
  namespace Applications {
    namespace Screens {
      class Calculator : public Screen {
      public:
        Calculator();
        ~Calculator() override;
      };
    }
  }
}
