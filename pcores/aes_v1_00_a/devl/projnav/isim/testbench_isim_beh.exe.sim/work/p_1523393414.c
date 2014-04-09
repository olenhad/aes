/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


char *work_p_1523393414_sub_2501934128_700753089(char *t1, char *t2, unsigned int t3, unsigned int t4)
{
    char t5[248];
    char t7[16];
    char t12[16];
    char t17[8];
    char t21[16];
    char t27[8];
    char *t0;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    int t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;

LAB0:    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 7;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t10 = (0 - 7);
    t11 = (t10 * -1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = (t12 + 0U);
    t13 = (t9 + 0U);
    *((int *)t13) = 3;
    t13 = (t9 + 4U);
    *((int *)t13) = 0;
    t13 = (t9 + 8U);
    *((int *)t13) = -1;
    t14 = (0 - 3);
    t11 = (t14 * -1);
    t11 = (t11 + 1);
    t13 = (t9 + 12U);
    *((unsigned int *)t13) = t11;
    t13 = (t5 + 4U);
    t15 = ((IEEE_P_2592010699) + 4024);
    t16 = (t13 + 88U);
    *((char **)t16) = t15;
    t18 = (t13 + 56U);
    *((char **)t18) = t17;
    xsi_type_set_default_value(t15, t17, t12);
    t19 = (t13 + 64U);
    *((char **)t19) = t12;
    t20 = (t13 + 80U);
    *((unsigned int *)t20) = 4U;
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 3;
    t23 = (t22 + 4U);
    *((int *)t23) = 0;
    t23 = (t22 + 8U);
    *((int *)t23) = -1;
    t24 = (0 - 3);
    t11 = (t24 * -1);
    t11 = (t11 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t11;
    t23 = (t5 + 124U);
    t25 = ((IEEE_P_2592010699) + 4024);
    t26 = (t23 + 88U);
    *((char **)t26) = t25;
    t28 = (t23 + 56U);
    *((char **)t28) = t27;
    xsi_type_set_default_value(t25, t27, t21);
    t29 = (t23 + 64U);
    *((char **)t29) = t21;
    t30 = (t23 + 80U);
    *((unsigned int *)t30) = 4U;
    t31 = (t2 + 40U);
    t32 = *((char **)t31);
    t31 = (t32 + t4);
    t11 = (7 - 7);
    t33 = (t11 * 1U);
    t34 = (0 + t33);
    t32 = (t31 + t34);
    t35 = (t13 + 56U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    memcpy(t35, t32, 4U);
    t8 = (t2 + 40U);
    t9 = *((char **)t8);
    t8 = (t9 + t4);
    t11 = (7 - 3);
    t33 = (t11 * 1U);
    t34 = (0 + t33);
    t9 = (t8 + t34);
    t15 = (t23 + 56U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    memcpy(t15, t9, 4U);
    t8 = (t1 + 1168U);
    t9 = *((char **)t8);
    t8 = (t13 + 56U);
    t15 = *((char **)t8);
    t10 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t15, t12);
    t14 = (t10 - 15);
    t11 = (t14 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t10);
    t33 = (t11 * 16U);
    t8 = (t23 + 56U);
    t16 = *((char **)t8);
    t24 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t16, t21);
    t37 = (t24 - 15);
    t34 = (t37 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t24);
    t38 = (t33 + t34);
    t39 = (8U * t38);
    t40 = (0 + t39);
    t8 = (t9 + t40);
    xsi_vhdl_check_range_of_slice(7, 0, -1, 7, 0, -1);
    t0 = xsi_get_transient_memory(8U);
    memcpy(t0, t8, 8U);

LAB1:    return t0;
LAB2:;
}


void ieee_p_2592010699_sub_3130575329_503743352();

extern void work_p_1523393414_init()
{
	static char *se[] = {(void *)work_p_1523393414_sub_2501934128_700753089};
	xsi_register_didat("work_p_1523393414", "isim/testbench_isim_beh.exe.sim/work/p_1523393414.didat");
	xsi_register_subprogram_executes(se);
	xsi_register_resolution_function(1, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
}
