<?php
declare(strict_types=1);

namespace Mediamonks\App\Controller;

use Symfony\Component\HttpFoundation\Response;

class BlogController
{
    /**
     * @return Response
     */
    public function index()
    {
        return new Response('<html><title>Blog home</title><body></body></html>');
    }
}

