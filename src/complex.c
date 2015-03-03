/***************************************************************************/
/*                                                                         */
/* complex.c - mruby gem provoding complex numbers                         */
/* Copyright (C) 2015 Paolo Bosetti                                        */
/* paolo[dot]bosetti[at]unitn.it                                           */
/* Department of Industrial Engineering, University of Trento              */
/*                                                                         */
/* This library is free software.  You can redistribute it and/or          */
/* modify it under the terms of the GNU GENERAL PUBLIC LICENSE 2.0.        */
/*                                                                         */
/* This library is distributed in the hope that it will be useful,         */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of          */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           */
/* Artistic License 2.0 for more details.                                  */
/*                                                                         */
/* See the file LICENSE                                                    */
/*                                                                         */
/***************************************************************************/

#include <stdlib.h>
#include <math.h>
#include "mruby.h"
#include "mruby/variable.h"
#include "mruby/data.h"
#include "mruby/class.h"
#include "mruby/value.h"

// Container for complex_data.
struct complex_data {
  double real, imag;
};

// Garbage collector handler, for complex_data struct
static void complex_data_destructor(mrb_state *mrb, void *p_) { free(p_); };

// Creating data type and reference for GC, in a const struct
const struct mrb_data_type complex_data_type = {"complex_data",
                                                complex_data_destructor};

// Macro loads from istanced object the value contained in
// @data var, that is actually the netbuf for a specif instance
// Obtains a pointer to allocated struct.
#define COMPLEX_DATA_STRUCT                                                    \
  DATA_GET_PTR(mrb, mrb_iv_get(mrb, self, mrb_intern_cstr(mrb, "@data")),      \
               &complex_data_type, struct netbuf_data);

// Check routines on @data instance variable
// Return true if @data is nil
#define CHECK_DATA_NIL                                                         \
  mrb_nil_p(mrb_iv_get(mrb, self, mrb_intern_cstr(mrb, "@data")))

/* ------------------------------------------------------------------------*/
void mrb_mruby_complex_gem_init(mrb_state *mrb) {
  struct RClass *complex;
  complex = mrb_define_class(mrb, "Complex", mrb->object_class);
}

void mrb_mruby_complex_gem_final(mrb_state *mrb) {}
