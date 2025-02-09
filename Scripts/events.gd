extends Node
signal resolveEvent()

func _ready() -> void:
	resolveEvent.connect(eventEffect)
	
func eventEffect(event: int):
	match event:
		1:
			EVENTS[13] = rememberSonEvent
			availableEvents.append(13)
		2:
			GameManager.foodReserve += 7
			GameManager.hosts.append("Alberto")
			EVENTS[14] = talkToAlberto
			availableEvents.append(14)
		5:
			EVENTS[15] = rememberJoseLuis
			availableEvents.append(15)
		6:
			GameManager.hosts.append("Isabel")
			GameManager.hosts.append("Rodrigo")
			EVENTS[11] = loveBirdsEvent
			availableEvents.append(11)
		7:
			EVENTS[16] = goToJacintoHouse
			availableEvents.append(16)
		10:
			EVENTS[12] = rememberAsunEvent
			availableEvents.append(12)
		14:
			GameManager.hosts.remove_at(GameManager.hosts.find("Alberto"))
		
	
var eventMultiplicator = 1
var availableEvents = [0,1,2,3,4,5,6,7,8,9,10]
var EVENTS = {
	0: [
		{
			"speaker" : "Francisco",
			"lines" : [
				"Amo este lugar",
				"Es un sitio hostil para la vida",
				"Y aqui hay que trabajar muchisimo sólo para sobrevivir cada día",
				"pero estas vistas...",
				"Hay magia en lo que veo, estoy seguro de ello"
			]
		}
	],
	1: [
		{
			"speaker" : "Francisco",
			"lines" : [
				"Podría buscarme un perrillo. Desde que murio Pantuflas he estado muy solo",
				"Y Alfonso ya nunca vuelve a casa. No vuelve desde que mama...",
				"Debería mandarle una carta en cuanto empiece el buen tiempo.",
				"Quizás así vendra a verme."
			]
		}
	],
	2: [
		{
			"speaker" : "Alberto",
			"lines" : [
				"Buenos días, ¿Hay alguien en casa?",
				"Voy camino de Bossost pero ahora con la nieve y la ventisca no me atrevo a cruzar",
				"¿Me hospedaría en su casa? Soy leñador y tengo un par de brazos fuertes que ofrecer. Seré de ayuda, lo prometo",
				"Sólo le pido un poco de comida. calor y agua estas semanas, ya en breve el tiempo amainará y no le molestaré más",
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Buenas Joven",
				"La verdad que me vendrian bien unos brazos más recios y menos cansados que los mios",
				"el aserradero hace mucho que necesita un buen arreglo, pero desde que mi hijo marchó no me veo capaz",
				"Eres bienvenido bajo mi techo, serás de mucha ayuda."
			]
		}
	],
	3 : [
		{
			"speaker" : "Francisco",
			"lines" : [
				"Es una pena ver la aldea tan pequeña, antes éramos muchos más, desde que reina Espartero muchos hombres han ido a las guerras del norte de África",
				"¿Que interés pueden tener en algo así?",
				"Hay cosas que jamás entenderé, o quizás solo estoy mayor"
			]
		}
	],
	4: [
		{
			"speaker" : "Francisco",
			"lines" : [
				"Como echo de menos no estar moqueando cada 20 segundos, el monte está precioso cubierto de nieve",
				"pero qué frio hace, ¿No podría la nieve ser calentita? ¿Sería mucho pedir? ¿Por qué Dios no nos concedió algo tan sencillo?",
				"Al menos la nieve trae silencio, me ayuda a recordar."
			]
		}
	],
	5: [
		{ 
		 	"speaker" : "Francisco",
			"lines" : [
				"Esa casa era de Jose Luis",
				"Ahora no es mas que un montón de madera hundiéndose en la nieve",
				"Que buenos tiempos pasamos juntos",
				"Ojalá hubiéramos ido a pescar al lago una última vez",
				"Me quedé sin contarte tantas cosas mi buen amigo",
				"Espero que me estes esperando allá arriba con una caña para tu amigo Francisco"
			]
		}
	],
	6: [
		{
			"speaker" : "Isabel",
			"lines" : [
				"Buenas buen señor, mi compañero Rodrigo y yo necesitamos cruzar la frontera, ¿Cómo esta el camino?"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Helado, nevado y nada recomendable.",
				"El camino se vuelve duro mas adelante, casi imposible de atravesar en invierno"
			]
		},
		{
			"speaker" : "Rodrigo",
			"lines" : [
				"Me temo que no tenemos otra opción",
				"Muchas gracias caballero",
				"Deseenos suerte"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"No me has entendido bien, niño",
				"no cruzaréis vivos estas montañas, no hasta que la nieve se derrita",
				"no tomes el consejo de este anciano en vano",
				"he sobrevivido a muchos inviernos aquí, y muchos peregrinos como vosotros han encontrado la fria muerte"
			]
		},
		{
			"speaker" : "Isabel",
			"lines" : [
				"Me temo que no tenemos otra opción, no tenemos a donde volver"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Tu amigo tiene buen portento y tú pareces una chiquilla educada",
				"No teneis donde volver, pero yo os puedo dar un lugar donde quedaros",
				"Nunca vienen mal un par de manos y seguro que cocinas mejor que este carcamal"
			]
		},
		{
			"speaker" : "Isabel",
			"lines" : [
				"Le estamos eternamente agradecidos por la oferta",
				"Aceptamos de buen grado"
			]
		},
		{
			"speaker" : "Rodrigo",
			"lines" : [
				"¡No se arrepentirá señor!"
			]
		},
	],
	7 : [
		{
			"speaker" : "Jacinto",
			"lines" : [
				"Buenos días Francisquito"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Te he dicho mil veces que no me llames así",
				"¿Por qué me tuvo que tocar un vecino tan pesado?"
			]
		},
		{
			"speaker" : "Jacinto",
			"lines" : [
				"Algo le habrás hecho al padre santo",
				"¿Estas comiendo bien?",
				"Hace unos dias abatí a una buena pieza, podemos compartir la carne"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Nunca le diría que no a una buena pata de corzo al horno",
				"Cuando la prepare te llevare un poco a tu casa, seguro que tu mujer se pone loca de contenta",
				"oye, ¿Te apetece que cuando deshiele vayamos al río a ver si pica algo?"
			]
		},
		{
			"speaker" : "Jacinto",
			"lines" : [
				"Claro mi amigo",
				"Como todos los años",
				"Hasta más ver, que no se te queme el culo de tanto pegarlo a la estufa"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Hasta Luego, nos vemos Jacinto",
				"Cuidate mucho, el frio está afilado este año."
			]
		},
	],
	8 : [
		{
			"speaker" : "Francisco",
			"lines" : [
				"Es una pena que no crezca nada ahora, se podrian hacer maravillas con la carne de aquí y unas setas",
				"incluso con unas castañas me valdría... mataría por unas castañas",
				"El año que viene tengo que hacer más cecina o embutido, este año estoy muy mal preparado",
				"pero cada año me cuesta más",
				"estos huesos ya no quieren moverse"
			]
		}
	],
	9 : [
		{
		"speaker" : "Francisco",
		"lines" : [
			"Estoy muy cansado de la política",
			"Menos mal que hace dias que ya no llega el diario",
			"Tanto cambio de reyes, tanto cambio de normas",
			"Estamos demasiado obsesionados por ver el color de la bandera que ondea en el cielo que nos olvidamos de como se siente el suelo que pisamos",
			"Pero que sabré yo, solo soy un pueblerino"
			]
		}
	],
	10: [
				{
		"speaker" : "Francisco",
		"lines" : [
			"Hoy voy a aprovechar para ir a limpiar la tumba de mi Asunción",
			"Un invierno más amable que este se la llevo hace ya 3 años",
			"Nunca supimos bien cual fue el problema, sólo espero que no sufriera mucho y que no este preocupada por mi",
			"No queda mucho para que nos volvamos a ver, mi amor"
			]
		}
	]
}

## Special Events

var loveBirdsEvent = [
		{
			"speaker": "Francisco",
			"lines" : [
				"La verdad que estoy agradeciendo mucho vuestra compañía, hacia años que no comia tan bien todos los días. Eres un hombre afortunado Rodrigo",
				"Me alegro que decidierais seguir mi consejo, sois demasiado amables para que la montaña os reclame"
			]
		},
		{
			"speaker": "Rodrigo",
			"lines" : [
				"Somos nosotros los que le estamos agradecidos, ayudaremos en todo lo que podamos",
				"La verdad que nos está viniendo genial esta pequeña pausa, este increible paisaje tambien ayuda. ¿Es siempre así de hermoso?"
			]
		},
		{
			"speaker": "Francisco",
			"lines" : [
				"Depende lo que consideres hermoso. Pero sí, vivo en un lugar maravilloso",
				"Al menos a mí me lo parece, nací aquí y no es que sea una persona muy viajada pero desde luego no me veo viviendo mis ultimos días en otro lugar.",
				"Hay algo cautivador en estas montañas"
			]
		},
		{
			"speaker": "Isabel",
			"lines" : [
				"Quizás... Podríamos quedarnos aquí Rodrigo ¿No hemos huido ya suficiente? ¿Acaso vendrán a por nosotros hasta aquí?",
				"¿No han sido suficients estos ultimos tres años? Ahora que hemos pasado unos días en un lugar tan acogedor, no quiero dejar esto"
			]
		},
		{
			"speaker": "Rodrigo",
			"lines" : [
				"mmmm...",
				"Francisco, no habrá por aquí alguna parcela de tierra que podamos usar ¿verdad?"
			]
		},
		{
			"speaker": "Francisco",
			"lines" : [
				"Por supuesto que la hay. Hay una parcela que perteneció a un antiguo amigo mio. Estoy convencido que le encantaría que la usarais",
				"¿Os gustaría ir a verla?"
			]
		},
		{
			"speaker": "Isabel",
			"lines" : [
				"Por supuesto. Gracias Francisco",
				"No sé que habremos hecho para mercer tu amabilidad"
			]
		},
		{
			"speaker": "Francisco",
			"lines" : [
				"Siempre puedes agradecermelo cocinandome de vez en cuando alguno de tus estofados. A este viejo saco de huesos le hace falta más carne",
			]
		},
	]

var rememberAsunEvent = [
		{
			"speaker": "Francisco",
			"lines" : [
				"Ay Asunción, ¿cuando tendré descanso? Estoy muy cansado",
				"Cada año me cuesta más superar cada día, las noches son muy frías y solitarias sin tí",
				"Aún encuentro alegría en la rutina, el respirar el aire fresco de la mañana, los paseos por el río, ir a pescar los veranos con Jacinto",
				"Estoy siendo un hipócrita",
				"Harto de la vida pero enamorado de los pequeños momentos que me regala, ojala fuera todo más fácil.",
				"Quizás es justo como debería ser. Quizás el valor esta justo en el contraste. Quizás la hipocresia es lo más real de la experiencia",
				"Ay Asun, no sé ni lo que digo, es la nieve, este silencio me hace irme por las nubes"
				]
		}
	]

var rememberSonEvent = [
		{
			"speaker": "Francisco",
			"lines" : [
				"Me pregunto que estará haciendo Alfonso ahora mismo. Espero que este bien",
				"No sé en que momento nos distanciamos tanto, a lo mejor nunca me esforce por entenderle. Su obsesión por la guerra y el éxito",
				"¿Tan mala es esta vida?",
				"No quiero ni imaginar lo que pasará con mi casa cuando yo no esté, seguro que él no vendra a usarla.",
				"Caera en desgracia, como la de Jose Luis...",
				"Debería hacerle una lista de las cosas que me gustaría que haga cuando ya no esté. Aunque es posible que se lo tome como las ultimas ordenes de un padre",
				"Qué difícil. Yo lo intenté hacer lo mejor que pude.",
				"Sólo espero que me recuerde con cariño"
				]
		}
	]
	
var talkToAlberto = [
		{
			"speaker": "Alberto",
			"lines" : [
				"Francisco, es hora de que continue mi camino. La ventisca ya ha remitido y mi siguiente parada esta sólo a un día de camino, debo darme prisa antes de que el clima me cierre el paso",
				"Agradezco de todo corazon tu hospitalidad. Has sido un magnifico anfitrión.",
				"Tengo ya todas mis cosas en un zurrón y me marcho ya, no quiero molestarte más."
			]
		},
		{
			"speaker": "Francisco",
			"lines" : [
				"Vaya, esto me ha pillado por sorpresa. Te deseo mucha suerte. Ten cuidado con el el camino, el frio esta muy afilado este año",
				"Aunque no sea temporada alta de osos no salgas de los caminos. Hay muchas cosas en los bosques que estan deseando clavarte el diente"
			]
		},
		{
			"speaker": "Alberto",
			"lines" : [
				"Que la vida sea gentil contigo y los tuyos Francisco",
				"Adios, reza por mí"
			]
		},
	]
	
var rememberJoseLuis = [
		{
			"speaker": "Francisco",
			"lines" : [
				"Siempre que paso por aquí y veo la casa de Jose Luis no puedo evitar sentir añoranza y un sentimiento de familiaridad.",
				"Hasta criamos a nuestros hijos juntos. Hace ya ocho años o asi que falleció.",
				"Al principio pensar en él era muy doloroso, pero lentamente sus recuerdos tienen un regusto dulce. Son de los momentos más felices que recuerdo, es normal sentirme así, ¿no?",
				"Sé que él pensaría igual si estuviera en mi lugar, es increible como de los mejores recuerdos que tengo son los que en algun momento me causaron dolor",
				"Cuantos más años pasan menos me entristece que acabará y más feliz me hace saber que estuve ahí para disfrutarlo mientras pude."
			]
		}
	]
	
var goToJacintoHouse = [
		{
			"speaker": "Francisco",
			"lines" : [
				"JACINTO, ABRE LA PUERTA. TRAIGO LA PATA DE CORZO, CORRE QUE SE ENFRIA",
				"...",
				"Ya era hora macho, ¿Quieres comer esto frío o qué?"
				]
		},
		{
			"speaker" : "Jacinto",
			"lines" : [
				"Este no va a cambiar jamás, igual que su padre, un impaciente, todo ya para ahora. Anda pasa",
				"¿Como va todo Francisquito? Hace días que no nos vemos, el tiempo no esta para pasear por el prado eh"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Qué no me llames así. ¿Dónde esta Milagros? Habra que saludarla"
			]
		},
		{
			"speaker" : "Jacinto",
			"lines" : [
				"Ha salido, ha ido a ver a mi cuñada",
				"Ven, sientate, tomemos un licor de hierbas juntos"
			]
		},
		{
			"speaker" : "Francisco",
			"lines" : [
				"Como los viejos tiempos entonces"
			]
		},
		{
			"speaker" : "Jacinto",
			"lines" : [
				"Nosotros somos los viejos, el resto es lo que no ha cambiado amigo mio."
			]
		}
	]
