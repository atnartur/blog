{% include "./header.html" %}
    <div class="container">
        <div class="row">
            <div class="col-md-9" id="main">
                <div class="posts">
                    <article>
                        <h1>Название поста</h1>
                        
                        <div class="post_content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi nulla magni dolore ipsum incidunt facilis dicta delectus voluptatem asperiores accusamus beatae possimus dolorem ab suscipit ipsam adipisci quas modi voluptatum.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat consectetur quos neque perferendis cupiditate placeat ad! Facilis soluta ipsa exercitationem quos ipsam illum magnam porro unde laborum maxime. Illo similique.</p>
                            <p>Fugit maiores quibusdam iusto inventore explicabo pariatur nobis tempore similique repudiandae magnam molestias rerum veniam excepturi fuga quasi cupiditate officia quisquam asperiores et nesciunt repellat doloribus nisi corporis fugiat molestiae!</p>
                            <p>Nam quas quibusdam recusandae id minima perferendis ullam enim vero asperiores error magni assumenda optio. Inventore nemo voluptates eos impedit neque reprehenderit accusantium consequatur cum minus dolores. At porro necessitatibus.</p>
                            <p>Ipsa est rem cupiditate repellat veritatis possimus quibusdam delectus quis harum ratione facere minima ex explicabo magnam nobis eveniet et inventore voluptatibus fuga architecto rerum enim non quaerat a deserunt.</p>
                            <p>Ad alias molestiae atque quia quisquam repellat vero quam saepe voluptas quo esse ullam facere tenetur placeat beatae magnam qui provident libero aliquid unde sunt quaerat ipsa possimus id iusto.</p>
                            
                            <p>Все кнопи “шаринга” и “лайков” предлагаемые от Twitter, Google+, LinkedIn, vk.com, Facebook обязывают нас внедрять в проекты их собственный JavaScript-код, каждый подключенный скрипт выполняет запросы и подгружает дополнительные файлы со сторонних серверов, каждый запрос «на сторону» замедляет скорость загрузки страницы и увеличивает нагрузку на устройство пользователя. Пользователь вынужден ждать пока будут закончены такие процессы как DNS-lookup, HTTP-запрос, затем ответ включающий в себя сам скрипт, стили и изображения используемые в кнопке.</p>
                            <p>Далее следует процесс проверки пользователя на предмет авторизации в социальной сети, парсинг пришедшей информации, перестраивание DOM’а и отрисовка новых элементов. После того как все необходимые процессы для появления самой кнопки — окончены, погруженный скрипт продолжает работать, устанавливает third-party cookies, следит за пользователем, его действиями и предпочтениями (вот откуда социальные сети показывают нам “правильную” рекламу).</p>
                            <p>Другой момент — все “шаринг/лайк”-кнопки находятся вне нашего контроля, как их поведение, так и стили на странице. </p>
                            <p>Мы решили использовать RESTful API (он же HTTP GET) и связку Twitter Bootstrap 3 + Font Awesome для имплементации кнопок “шаринга” и “лайков” от всех популярных социальных сетей. Данный подход применим к любому открытому REST-функционалу не требующему авторизации приложения, любой социальной сети.</p>
                        </div>
                        <div class="post_footer">
                            <div class="post_info">
                                <i class="fa fa-calendar-o"></i> 14.05.2015 14.09
                            </div>
                            <div class="btn-group social_buttons">
                                <button
                                  class="btn btn-default disabled"
                                >
                                  Поделиться:
                                </button>
                              
                                <a class="btn btn-default" target="_blank" title="Через ВКонтакте" 
                                    href="http://vk.com/share.php?url=_URL_&title=_TITLE_&description=_DESCTEXT_&image=_URL_TO_MEDIA"
                                >
                                  <i class="fa fa-vk fa-lg vk"></i>
                                </a>
                              
                                <a class="btn btn-default" target="_blank" title="Через Твиттер"
                                    href="http://twitter.com/share?url=_URL_&text=_DESCTEXT_"
                                >
                                  <i class="fa fa-twitter fa-lg tw"></i>
                                </a>
                              
                                <a class="btn btn-default" target="_blank" title="Через Facebook"
                                    href="http://www.facebook.com/sharer.php?u=_URL_&t=_DESCTEXT_"
                                >
                                    <i class="fa fa-facebook fa-lg fb"></i>
                                </a>
                                <a class="btn btn-default" target="_blank" title="Через Google Plus"
                                    href="https://plusone.google.com/_/+1/confirm?hl=en&url=_URL_"
                                >
                                  <i class="fa fa-google-plus fa-lg google"></i>
                                </a>
                            </div>
                        </div>
                    </article>
                    
                    <div class="blog-comment">
                        <h1>Комментарии</h1>
                        <hr/>
                        <ul class="comments">
                        <li class="clearfix">
                          <img src="http://bootdey.com/img/Content/user_1.jpg" class="avatar" alt="">
                          <div class="post-comments">
                                <p class="meta">
                                    18 декабря 2014 <a href="#">JohnDoe</a> сказал:
                                    <a href="#" class="pull-right">
                                        <small>Ответить</small>
                                    </a>
                                </p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Etiam a sapien odio, sit amet
                                </p>
                          </div>
                        </li>
                        <li class="clearfix">
                          <img src="http://bootdey.com/img/Content/user_2.jpg" class="avatar" alt="">
                          <div class="post-comments">
                              <p class="meta">Dec 19, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
                              <p>
                                  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                  Etiam a sapien odio, sit amet
                              </p>
                          </div>
                        
                          <ul class="comments">
                              <li class="clearfix">
                                  <img src="http://bootdey.com/img/Content/user_3.jpg" class="avatar" alt="">
                                  <div class="post-comments">
                                      <p class="meta">Dec 20, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
                                      <p>
                                          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                          Etiam a sapien odio, sit amet
                                      </p>
                                  </div>
                              </li>
                          </ul>
                        </li>
                        </ul>
                    </div> <!-- // .blog-comment -->
                    
                    <form class="comment-form">
                        <h1>Оставить комментарий</h1>
                        <div class="form-group">
                            <input type="text" id="name" name="name" class="form-control" placeholder="Имя *" required>
                        </div>
                        <div class="form-group">
                            <input type="email" id="email" name="email" class="form-control" placeholder="E-mail * (не публикуется)" required>
                        </div>
                        <div class="form-group">
                            <input type="text" id="site" name="site" class="form-control" placeholder="Сайт">
                        </div>
                        <div class="form-group">
                            <label for="text">Текст комментария</label>
                            <textarea name="text" id="text" class="form-control" requred></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg pull-right">Отправить</button>
                    </form>
                </div> <!-- // .posts -->
            </div> <!-- // #main --> 
            {% include "./sidebar.html" %}
        </div> <!-- // .row -->
    </div> <!-- // .container -->
{% include "./footer.html" %}