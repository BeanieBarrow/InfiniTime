#include "displayapp/screens/Calculator.h"
#include "displayapp/DisplayApp.h"

using namespace Pinetime::Applications::Screens;

Calculator::Calculator() : Screen() {
  lv_obj_t* title = lv_label_create(lv_scr_act(), nullptr);
  lv_label_set_text_static(title, "Calculator");
  lv_label_set_align(title, LV_LABEL_ALIGN_CENTER);
  lv_obj_align(title, lv_scr_act(), LV_ALIGN_CENTER, 0, 0);
}

Calculator::~Calculator() {
  lv_obj_clean(lv_scr_act());
}
