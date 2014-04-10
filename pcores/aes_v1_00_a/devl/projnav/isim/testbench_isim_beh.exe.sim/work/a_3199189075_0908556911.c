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
char *work_p_1523393414_sub_3093672269_700753089(char *, char *, unsigned int , unsigned int );
char *work_p_1523393414_sub_3859375582_700753089(char *, char *, unsigned int , unsigned int );
char *work_p_1523393414_sub_623480404_700753089(char *, char *, unsigned int , unsigned int );


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

LAB0:    xsi_set_current_line(163, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)1);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 7248);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 7104);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t1 = (t0 + 7248);
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

LAB0:    xsi_set_current_line(164, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t12 = (t0 + 7312);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t12);

LAB2:    t17 = (t0 + 7120);
    *((int *)t17) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 2792U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t6);
    t1 = (t0 + 7312);
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
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(168, ng0);

LAB3:    t1 = (t0 + 3712U);
    t2 = work_p_1523393414_sub_3859375582_700753089(WORK_P_1523393414, t1, 0U, 0U);
    t3 = (t0 + 7376);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 32U);
    xsi_driver_first_trans_fast(t3);

LAB2:    t8 = (t0 + 7136);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3199189075_0908556911_p_3(char *t0)
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

LAB0:    xsi_set_current_line(169, ng0);

LAB3:    t1 = (t0 + 3872U);
    t2 = work_p_1523393414_sub_3093672269_700753089(WORK_P_1523393414, t1, 0U, 0U);
    t3 = (32U != 32U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t4 = (t0 + 7440);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast_port(t4);

LAB2:    t9 = (t0 + 7152);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB6;

}

static void work_a_3199189075_0908556911_p_4(char *t0)
{
    char t18[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    int t16;
    int t17;
    char *t19;
    char *t20;
    char *t21;
    static char *nl0[] = {&&LAB20, &&LAB21, &&LAB22};

LAB0:    xsi_set_current_line(172, ng0);
    t1 = (t0 + 4032U);
    t2 = work_p_1523393414_sub_623480404_700753089(WORK_P_1523393414, t1, 0U, 0U);
    t3 = (t0 + 7504);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 128U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(173, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t8 = 1;
    if (128U == 128U)
        goto LAB4;

LAB5:    t8 = 0;

LAB6:    if (t8 == 0)
        goto LAB2;

LAB3:    xsi_set_current_line(175, ng0);
    t1 = (t0 + 992U);
    t10 = xsi_signal_has_event(t1);
    if (t10 == 1)
        goto LAB13;

LAB14:    t8 = (unsigned char)0;

LAB15:    if (t8 != 0)
        goto LAB10;

LAB12:
LAB11:    t1 = (t0 + 7168);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t5 = (t0 + 12300);
    xsi_report(t5, 23U, (unsigned char)1);
    goto LAB3;

LAB4:    t9 = 0;

LAB7:    if (t9 < 128U)
        goto LAB8;
    else
        goto LAB6;

LAB8:    t1 = (t2 + t9);
    t4 = (t3 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t4))
        goto LAB5;

LAB9:    t9 = (t9 + 1);
    goto LAB7;

LAB10:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t13 = *((unsigned char *)t4);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(184, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t8);
    goto **((char **)t1);

LAB13:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t11 = *((unsigned char *)t3);
    t12 = (t11 == (unsigned char)3);
    t8 = t12;
    goto LAB15;

LAB16:    xsi_set_current_line(179, ng0);
    t2 = (t0 + 7568);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t1 = (t0 + 7632);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(181, ng0);
    t1 = (t0 + 7696);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(182, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 7760);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 32U);
    xsi_driver_first_trans_fast(t3);

LAB17:    goto LAB11;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(186, ng0);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB19;

LAB21:    xsi_set_current_line(193, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t10 = (t8 == (unsigned char)3);
    if (t10 != 0)
        goto LAB26;

LAB28:
LAB27:    goto LAB19;

LAB22:    xsi_set_current_line(205, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t8 = (t16 == 0);
    if (t8 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(208, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t10 = (t8 == (unsigned char)2);
    if (t10 != 0)
        goto LAB35;

LAB37:
LAB36:
LAB33:    goto LAB19;

LAB23:    xsi_set_current_line(187, ng0);
    t3 = (t0 + 7568);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = (unsigned char)1;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(188, ng0);
    t1 = (t0 + 4688U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t17 = (t16 - 1);
    t1 = (t0 + 7632);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = t17;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(189, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 7760);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 32U);
    xsi_driver_first_trans_fast(t3);
    goto LAB24;

LAB26:    xsi_set_current_line(195, ng0);
    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t1 = (t0 + 11696U);
    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    t4 = (t0 + 11664U);
    t6 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t18, t3, t1, t5, t4);
    t7 = (t0 + 7760);
    t15 = (t7 + 56U);
    t19 = *((char **)t15);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(196, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t8 = (t16 == 0);
    if (t8 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(200, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t17 = (t16 - 1);
    t1 = (t0 + 7632);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = t17;
    xsi_driver_first_trans_fast(t1);

LAB30:    goto LAB27;

LAB29:    xsi_set_current_line(197, ng0);
    t1 = (t0 + 7568);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(198, ng0);
    t1 = (t0 + 4808U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t17 = (t16 - 1);
    t1 = (t0 + 7696);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = t17;
    xsi_driver_first_trans_fast(t1);
    goto LAB30;

LAB32:    xsi_set_current_line(206, ng0);
    t1 = (t0 + 7568);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB33;

LAB35:    xsi_set_current_line(209, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t16 = *((int *)t3);
    t17 = (t16 - 1);
    t1 = (t0 + 7696);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t17;
    xsi_driver_first_trans_fast(t1);
    goto LAB36;

}


extern void work_a_3199189075_0908556911_init()
{
	static char *pe[] = {(void *)work_a_3199189075_0908556911_p_0,(void *)work_a_3199189075_0908556911_p_1,(void *)work_a_3199189075_0908556911_p_2,(void *)work_a_3199189075_0908556911_p_3,(void *)work_a_3199189075_0908556911_p_4};
	xsi_register_didat("work_a_3199189075_0908556911", "isim/testbench_isim_beh.exe.sim/work/a_3199189075_0908556911.didat");
	xsi_register_executes(pe);
}
