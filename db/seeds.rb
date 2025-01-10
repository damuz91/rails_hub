# Para recrear la db y poblarla con datos de prueba, ejecutar: rails db:drop db:create db:migrate db:seed

# User
user = User.create(email_address: 'admin@railshub.com', password: 'qwer1234', password_confirmation: 'qwer1234', username: 'admin')

# Categorías iniciales
categories = Category.create!([
  { name: 'Tecnología' },
  { name: 'Educación' },
  { name: 'Entretenimiento' },
  { name: 'Deportes' },
  { name: 'Música' }
])

# Videos iniciales
videos = [
  { title: 'Cómo construir una app en Rails 8', description: 'Un tutorial paso a paso para crear una aplicación con Ruby on Rails.', duration: '15:32' },
  { title: 'Introducción al cálculo diferencial', description: 'Aprende las bases del cálculo diferencial en este curso.', duration: '12:45' },
  { title: 'Top 10 momentos divertidos de 2025', description: 'Disfruta de los momentos más graciosos del año.', duration: '10:10' },
  { title: 'Cómo mejorar tu saque en tenis', description: 'Consejos para perfeccionar tu técnica en el saque.', duration: '08:50' },
  { title: 'Las mejores canciones del 2025', description: 'Un mix con los éxitos musicales del año.', duration: '18:00' },
  { title: 'Introducción a la inteligencia artificial', description: 'Conoce los conceptos básicos de IA y su impacto en el futuro.', duration: '20:15' },
  { title: 'Aprendiendo a programar en Python', description: 'Una guía para principiantes sobre programación en Python.', duration: '25:30' },
  { title: 'Cómo editar videos como un profesional', description: 'Tutorial para usar herramientas avanzadas de edición de video.', duration: '14:25' },
  { title: 'Los mejores goles del año', description: 'Una recopilación de los mejores momentos del fútbol.', duration: '09:10' },
  { title: 'El top 10 de canciones virales en TikTok', description: 'Un playlist con las canciones más populares de TikTok.', duration: '13:50' },
  { title: 'El futuro de la tecnología blockchain', description: 'Explora cómo la blockchain cambiará el mundo.', duration: '16:20' },
  { title: 'Cómo aprender matemáticas de manera divertida', description: 'Estrategias para estudiar matemáticas sin aburrirse.', duration: '11:30' },
  { title: '10 datos curiosos sobre el universo', description: 'Explora los misterios más fascinantes del cosmos.', duration: '08:40' },
  { title: 'Los mejores trucos para jugar al fútbol', description: 'Técnicas avanzadas para mejorar tus habilidades.', duration: '09:25' },
  { title: 'Canciones icónicas de los años 90', description: 'Un viaje musical por las mejores canciones de la década.', duration: '22:00' },
  { title: 'Cómo configurar tu propia red local', description: 'Guía para montar una red en casa o en la oficina.', duration: '17:40' },
  { title: 'Introducción al diseño gráfico', description: 'Conceptos básicos y herramientas para diseñadores principiantes.', duration: '19:00' },
  { title: 'Las películas más taquilleras del año', description: 'Una revisión de los éxitos del cine en 2025.', duration: '12:20' },
  { title: 'Cómo entrenar para un maratón', description: 'Plan de entrenamiento y consejos prácticos.', duration: '21:45' },
  { title: 'Playlist: Las mejores baladas románticas', description: 'Una selección de las baladas más románticas de todos los tiempos.', duration: '23:15' }
]

videos.each_with_index do |video, index|
  Video.create!(
    title: video[:title],
    description: video[:description],
    duration: video[:duration],
    likes_count: rand(0..500), # Likes aleatorios entre 0 y 500
    views_count: rand(100..5000), # Vistas aleatorias entre 100 y 5000
    category: categories[index % categories.size], # Distribuir las categorías
    user: user
  )
end
