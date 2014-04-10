/*****************************************************************************
* Filename:          C:\ee4218-aes\aes2\drivers/aes_v1_00_a/src/aes_selftest.c
* Version:           1.00.a
* Description:       
* Date:              Thu Apr 10 01:52:58 2014 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#include "xparameters.h"
#include "aes.h"

/* IMPORTANT:
*  In order to run this self test, you need to modify the value of following
*  micros according to the slot ID defined in xparameters.h file. 
*/
#define input_slot_id   XPAR_FSL_AES_0_INPUT_SLOT_ID
#define output_slot_id  XPAR_FSL_AES_0_OUTPUT_SLOT_ID

XStatus AES_SelfTest()
{
	 unsigned int input_0[4];     
	 unsigned int output_0[4];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     
	 input_0[1] = 24690;     
	 input_0[2] = 37035;     
	 input_0[3] = 49380;     

	 //Call the macro with instance specific slot IDs
	 aes(
		 input_slot_id,
		 output_slot_id,
		 input_0,      
		 output_0       
		 );

	 if (output_0[0] != 123450)
		 return XST_FAILURE;
	 if (output_0[3] != 123450)
		 return XST_FAILURE;

	 return XST_SUCCESS;
}
