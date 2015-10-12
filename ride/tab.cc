// Copyright (2015) Gustav

#include "ride/tab.h"

#include <ride/wx.h>
#include <cassert>

#include "ride/fileedit.h"
#include "ride/startpage.h"

Tab::Tab(FileEdit* edit) : edit_(edit), start_(NULL), data_(NULL) {
  assert(edit);
}

Tab::Tab(StartPageTab* start) : edit_(NULL), start_(start), data_(NULL) {
  assert(start);
}

Tab::Tab(TabData* data) : edit_(NULL), start_(NULL), data_(data) {
  assert(data);
}

Tab::~Tab() {}

FileEdit* Tab::ToFileEdit() {
  assert(this);
  return edit_;
}

StartPageTab* Tab::ToStartPage() {
  assert(this);
  return start_;
}

wxControl* Tab::ToControl() {
  if (start_)
    return start_;
  else if (edit_)
    return edit_;
  return NULL;
}
