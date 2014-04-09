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
static const char *ng0 = "C:/ee4218-aes/aes2/pcores/aes_v1_00_a/devl/projnav/aes_t.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_1523393414;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
char *work_p_1523393414_sub_2501934128_700753089(char *, char *, unsigned int , unsigned int );


static void work_a_3199189075_0908556911_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)1);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 6184);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 6056);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t1 = (t0 + 6184);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3199189075_0908556911_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(151, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t12 = (t0 + 6248);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t12);

LAB2:    t17 = (t0 + 6072);
    *((int *)t17) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 2792U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t6);
    t1 = (t0 + 6248);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3199189075_0908556911_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(154, ng0);

LAB3:    t1 = (t0 + 3552U);
    t2 = work_p_1523393414_sub_2501934128_700753089(WORK_P_1523393414, t1, 0U, 0U);
    t3 = (8U != 8U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t4 = (t0 + 6312);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_delta(t4, 24U, 8U, 0LL);

LAB2:    t9 = (t0 + 6088);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB6;

}

static void work_a_3199189075_0908556911_p_3(char *t0)
{
    char t17[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    char *t18;
    char *t19;
    char *t20;
    static char *nl0[] = {&&LAB12, &&LAB13, &&LAB14};

LAB0:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 6104);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(158, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 2952U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (char *)((nl0) + t1);
    goto **((char **)t2);

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(161, ng0);
    t4 = (t0 + 6376);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)0;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 6440);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 6504);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(164, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 6568);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t5);

LAB9:    goto LAB3;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(168, ng0);
    t5 = (t0 + 1992U);
    t8 = *((char **)t5);
    t3 = *((unsigned char *)t8);
    t6 = (t3 == (unsigned char)3);
    if (t6 != 0)
        goto LAB15;

LAB17:
LAB16:    goto LAB11;

LAB13:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB18;

LAB20:
LAB19:    goto LAB11;

LAB14:    xsi_set_current_line(187, ng0);
    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t1 = (t15 == 0);
    if (t1 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB27;

LAB29:
LAB28:
LAB25:    goto LAB11;

LAB15:    xsi_set_current_line(169, ng0);
    t5 = (t0 + 6376);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)1;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 3888U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t16 = (t15 - 1);
    t2 = (t0 + 6440);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t16;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(171, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 6568);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    goto LAB16;

LAB18:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 3112U);
    t5 = *((char **)t2);
    t2 = (t0 + 10068U);
    t8 = (t0 + 1672U);
    t11 = *((char **)t8);
    t8 = (t0 + 10036U);
    t12 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t17, t5, t2, t11, t8);
    t13 = (t0 + 6568);
    t14 = (t13 + 56U);
    t18 = *((char **)t14);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t12, 32U);
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(178, ng0);
    t2 = (t0 + 3272U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t1 = (t15 == 0);
    if (t1 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 3272U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t16 = (t15 - 1);
    t2 = (t0 + 6440);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t16;
    xsi_driver_first_trans_fast(t2);

LAB22:    goto LAB19;

LAB21:    xsi_set_current_line(179, ng0);
    t2 = (t0 + 6376);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 4008U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t16 = (t15 - 1);
    t2 = (t0 + 6504);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t16;
    xsi_driver_first_trans_fast(t2);
    goto LAB22;

LAB24:    xsi_set_current_line(188, ng0);
    t2 = (t0 + 6376);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB25;

LAB27:    xsi_set_current_line(191, ng0);
    t2 = (t0 + 3432U);
    t5 = *((char **)t2);
    t15 = *((int *)t5);
    t16 = (t15 - 1);
    t2 = (t0 + 6504);
    t8 = (t2 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = t16;
    xsi_driver_first_trans_fast(t2);
    goto LAB28;

}


extern void work_a_3199189075_0908556911_init()
{
	static char *pe[] = {(void *)work_a_3199189075_0908556911_p_0,(void *)work_a_3199189075_0908556911_p_1,(void *)work_a_3199189075_0908556911_p_2,(void *)work_a_3199189075_0908556911_p_3};
	xsi_register_didat("work_a_3199189075_0908556911", "isim/testbench_isim_beh.exe.sim/work/a_3199189075_0908556911.didat");
	xsi_register_executes(pe);
}
