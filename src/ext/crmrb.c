#include "crmrb.h"

static mrb_value mrb_cc_im_execute(mrb_state *mrb, mrb_value self) {
  char *arg = NULL;
  mrb_get_args(mrb, "z", &arg);

  fprintf(stdout, "%s\n", arg);

  return self;
}

void crmrb_execute(char *code) {
  mrb_state *mrb = mrb_open();

  struct RClass *mrb_sc_class = mrb_define_class(mrb, "CustomClass", mrb->object_class);
  mrb_define_method(mrb, mrb_sc_class, "execute", mrb_cc_im_execute, MRB_ARGS_REQ(1));

  mrb_load_string(mrb, code);

  mrb_close(mrb);
}
