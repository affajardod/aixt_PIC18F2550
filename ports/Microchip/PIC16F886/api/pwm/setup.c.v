/ Project Name: Aixt project, https://gitlab.com/fermarsan/aixt-project.git
// File Name: pwm setup.c.v
// Author: Luis Alfredo Pinto Medina and Fernando Martínez Santa
// Date: 2024
// License: MIT
//
// Description: Pin management functions (PIC16F886 port)

module pwm

#define pwm__setup(pin1, pin2) \
    PR2 = 0x3E;                        /* Valor del período del PWM */ \
    CCPR##pin1##L = 0;                 /* Inicializa el registro CCP en 0 dependiendo el CCP que configure el usuario*/ \
    TRISCbits.TRISC##pin2 = 0;         /* Configura el Pin correspondiente como salida dependiendo el pin que configure el usuario */ \
    T2CON = 0b00000011;                /* Configuración del Timer 2 */ \
    CCP##pin1##CON = 0b00001100;       /* Configura el registro CCP en modo PWM dependiendo el CCP que configure el usuario*/ \
    TMR2 = 0;                          /* Inicializa el Timer 2 en 0 */ \
    T2CONbits.TMR2ON = 1;              /* Enciende el Timer 2 */